/* 
 * File:   ImageConverter.h
 * Author: haikalpribadi
 *
 * Created on July 12, 2012, 2:15 PM
 */

#ifndef IMAGECONVERTER_H
#define	IMAGECONVERTER_H

#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>

class ImageConverter {
public:
    ImageConverter();
    virtual ~ImageConverter();
private:
    ros::NodeHandle node_handle_;
    image_transport::ImageTransport img_transport_;
    image_transport::Subscriber img_sub_;
    image_transport::Publisher img_pub_;
    
    void imageCallback(const sensor_msgs::ImageConstPtr& message);
};

#endif	/* IMAGECONVERTER_H */

