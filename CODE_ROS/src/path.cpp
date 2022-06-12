#include "ros/ros.h"
#include "std_msgs/String.h"
#include <geometry_msgs/Twist.h>
#include <string>
#include <sstream>

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "path");

  ros::NodeHandle n;


  ros::Publisher chatter_pub = n.advertise<geometry_msgs::Twist>("darwin/cmd_vel", 1000);

  ros::Rate loop_rate(1000);
  float v =0.7;
  int count = 0;
  geometry_msgs::Twist vel;
  
  while (ros::ok())
  {
    
    if(count < 5000)
    {
      vel.angular.z = 0;
      vel.linear.x = v;
      vel.linear.y = 0;
    }
    else if(count >= 5000 && count <7000 )
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = 0;

    }
    else if(count >= 7000 && count <13000 )
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = v;
      
    }
    else if(count >= 13000 && count <15000 )
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = 0;

    }
    else if(count >= 15000 && count <21000 )
    {
      vel.angular.z = 0;
      vel.linear.x = v;
      vel.linear.y = 0;
      
    }
    else if(count >= 21000 && count <23000 )
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = 0;

    }
    else if(count >= 23000 && count <28000 )
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = -v;
      
    }
    else if(count >= 28000 && count <30000 )
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = 0;

    }
    else if(count >= 21000 && count <23000 )
    {
      vel.angular.z = 0;
      vel.linear.x = v;
      vel.linear.y = 0;

    }
    else
    {
      vel.angular.z = 0;
      vel.linear.x = 0;
      vel.linear.y = 0;

    }
    chatter_pub.publish(vel); 
    ///////////////
    

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}