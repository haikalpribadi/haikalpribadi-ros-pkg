/* 
 * File:   CircleTracker.h
 * Author: haikalpribadi
 *
 * Created on July 14, 2012, 12:24 PM
 */

#ifndef CIRCLETRACKER_H
#define	CIRCLETRACKER_H

#include <ros/ros.h>
#include <math.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/image_encodings.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#define camerawindow "Camera Image"
#define hsvwindow "HSV Image"
#define filteredwindow "Filtered Image"

class CircleTracker {
public:
    CircleTracker();
    virtual ~CircleTracker();
private:
    ros::NodeHandle node_handle_;
    image_transport::ImageTransport img_transport_;
    image_transport::Subscriber img_sub_;
    
    void imageCallback(const sensor_msgs::ImageConstPtr& message);

};

#endif	/* CIRCLETRACKER_H */

