/* 
 * File:   RedRectangleTracker.cpp
 * Author: haikalpribadi
 * 
 * Created on July 12, 2012, 6:58 PM
 */

#include "RedRectangleTracker.h"

RedRectangleTracker::RedRectangleTracker() :
  img_transport_(node_handle_), thresh(50), N(20)
{
  img_sub_ = img_transport_.subscribe("/camera/rgb/image_color", 1, &RedRectangleTracker::imageCallback, this);
    
  cv::namedWindow(windowname);
}

RedRectangleTracker::~RedRectangleTracker()
{
  cv::destroyWindow(windowname);
}

void RedRectangleTracker::imageCallback(const sensor_msgs::ImageConstPtr& message)
{
  cv_bridge::CvImagePtr cv_ptr;
  try
  {
    cv_ptr = cv_bridge::toCvCopy(message, sensor_msgs::image_encodings::BGR8);
  }
  catch(cv_bridge::Exception& ex)
  {
    ROS_ERROR("cv_bridge exception: %s", ex.what());
    return;
  }
  std::vector<std::vector<cv::Point> > squares;
  findSquares(cv_ptr->image, squares);
  drawSquares(cv_ptr->image, squares);
}

double RedRectangleTracker::angle(cv::Point pt1, cv::Point pt2, cv::Point pt0)
{
  double dx1 = pt1.x - pt0.x;
  double dy1 = pt1.y - pt0.y;
  double dx2 = pt2.x - pt0.y;
  double dy2 = pt2.y - pt0.y;

  return (dx1 * dx2 + dy1 * dy2) / std::sqrt((dx1 * dx1 + dy1 * dy1)*(dx2 * dx2 + dy2 * dy2) + 1e-10);
}

void RedRectangleTracker::findSquares(const cv::Mat& image, std::vector<std::vector<cv::Point> >& squares)
{
  squares.clear();
  cv::Mat pyr, timg, gray0(image.size(), CV_8U), gray;

  // down-scale and up-scale the image to filter out noises
  cv::pyrDown(image, pyr, cv::Size(image.cols / 2, image.rows / 2));
  cv::pyrUp(pyr, timg, image.size());
  std::vector<std::vector<cv::Point> > contours;

  // find squares in every color plane of the image
  for (int c = 0; c < 3; c++)
  {
    int ch[] = {c, 0};
    cv::mixChannels(&timg, 1, &gray0, 1, ch, 1);

    //try several threshold levels
    for (int l = 0; l < N; l++)
    {
      if (l == 0)
      {
        // apply Canny. Take the upper threshold from the slider
        // and set the lower to 0 (which forces edges merging)
        cv::Canny(gray0, gray, 0, thresh, 5);
        // dilate canny output to remove potential holes
        // between edge segments
        dilate(gray, gray, cv::Mat(), cv::Point(-1, -1));
      }
      else
      {
        // apply threshold if l!=0:
        gray = gray0 >= (l+1)*255/N;
      }
      
      // find contours and store them all as a list
      cv::findContours(gray, contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);
      
      std::vector<cv::Point> approx;
      
      // test each contour
      for( size_t i=0; i<contours.size(); i++)
      {
        // approximate contour with accuracy proportional to the contour perimeter
        cv::approxPolyDP(cv::Mat(contours[i]), approx, 
          cv::arcLength(cv::Mat(contours[i]), true)*0.02, true);
        
        if(approx.size() == 4 && fabs(contourArea(cv::Mat(approx))) > 1000 && 
          cv::isContourConvex(cv::Mat(approx)))
        {
          double maxCosine = 0;
          
          for(int j=2; j<5; j++)
          {
            // find the maximum cosine of the angle between joint edges
            double cosine = fabs(angle(approx[j%4], approx[j-2], approx[j-1]));
            maxCosine = MAX(maxCosine, cosine);
          }
          
          // if cosines of all angles are small (all angles are ~90 degrees)
          // then write quandrange vertices to resultant sequence
          if( maxCosine < 0.3 )
            squares.push_back(approx);
        }
      }
    }
  }
}

void RedRectangleTracker::drawSquares(cv::Mat& image, const std::vector<std::vector<cv::Point> >& squares)
{
  for(size_t i=0; i<squares.size(); i++)
  {
    const cv::Point* p = &squares[i][0];
    int n = (int) squares[i].size();
    cv::polylines(image, &p, &n, 1, true, cv::Scalar(0,255,0), 3, CV_AA);
  }
  
  cv::imshow(windowname, image);
  cv::waitKey(3);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "red_rectangle_tracker");
  RedRectangleTracker rrt;
  ros::spin();
  return 0;
}
