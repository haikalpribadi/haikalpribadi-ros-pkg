/* 
 * File:   ImageConverter.cpp
 * Author: haikalpribadi
 * 
 * Created on July 12, 2012, 2:15 PM
 */

#include "ImageConverter.h"

ImageConverter::ImageConverter() : img_transport_(node_handle_)
{
  img_pub_ = img_transport_.advertise("/cv_image", 1);
  img_sub_ = img_transport_.subscribe("/camera/rgb/image_color", 1, &ImageConverter::imageCallback, this);

  //just for testing
  cv::namedWindow("Image window");
}

ImageConverter::~ImageConverter()
{
  cv::destroyWindow("Image window");
}

void ImageConverter::imageCallback(const sensor_msgs::ImageConstPtr& message)
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
  
  if(cv_ptr->image.rows>60 && cv_ptr->image.cols>60)
    cv::circle(cv_ptr->image, cv::Point(50,50), 10, CV_RGB(255,0,0));
  
  cv::imshow("Image window", cv_ptr->image);
  cv::waitKey(3);
  
  img_pub_.publish(cv_ptr->toImageMsg());
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_converter");
  ImageConverter imgConverter;
  ros::spin();
  return 0;
}

