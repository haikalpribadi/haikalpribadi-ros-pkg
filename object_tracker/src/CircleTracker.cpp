/* 
 * File:   CircleTracker.cpp
 * Author: haikalpribadi
 * 
 * Created on July 14, 2012, 12:24 PM
 */

#include "CircleTracker.h"

CircleTracker::CircleTracker() : img_transport_(node_handle_)
{
  img_sub_ = img_transport_.subscribe("/camera/rgb/image_color", 1, &CircleTracker::imageCallback, this);

  cv::namedWindow(camerawindow);
  cv::namedWindow(hsvwindow);
  cv::namedWindow(filteredwindow);
}

CircleTracker::~CircleTracker()
{
  cv::destroyWindow(camerawindow);
  cv::destroyWindow(hsvwindow);
  cv::destroyWindow(filteredwindow);
}

void CircleTracker::imageCallback(const sensor_msgs::ImageConstPtr& message)
{
  cv_bridge::CvImagePtr cv_img_ptr;
  try
  {
    cv_img_ptr = cv_bridge::toCvCopy(message, sensor_msgs::image_encodings::BGR8);
  }
  catch (cv_bridge::Exception ex)
  {
    ROS_ERROR("cv_bridge exception: %s", ex.what());
  }

  //cv::Mat img_hsv(cv_img_ptr->image.size(), CV_8U);
  cv::Mat img_hsv, img_filtered;
  cv::cvtColor(cv_img_ptr->image, img_hsv, CV_BGR2HSV);
  cv::inRange(img_hsv, cv::Scalar(150, 180, 100), cv::Scalar(255, 255, 255), img_filtered);
  cv::GaussianBlur(img_filtered, img_filtered, cv::Size(5, 5), 0, 0);

  std::vector<cv::Vec3f> circles;
  cv::HoughCircles(img_filtered, circles, CV_HOUGH_GRADIENT, 2, 100, 100, 50, 10, 80);

  for (size_t i = 0; i < circles.size(); i++)
  {
    cv::Vec3i c = circles[i];
    cv::circle(cv_img_ptr->image, cv::Point(c[0], c[1]), c[2], cv::Scalar(0, 0, 255), 3, CV_AA);
    cv::circle(cv_img_ptr->image, cv::Point(c[0], c[1]), 2, cv::Scalar(0, 255, 0), 3, CV_AA);
  }
  cv::imshow(camerawindow, cv_img_ptr->image);
  cv::imshow(hsvwindow, img_hsv);
  cv::imshow(filteredwindow, img_filtered);
  cv::waitKey(3);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "circle_tracker");
  CircleTracker tracker;
  ros::spin();
  return 0;
}

