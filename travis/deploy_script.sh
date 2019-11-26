#!/bin/bash

create_test_ECS_Service(){
    echo "Create ECS service for functional test"
    aws ecs create-service \
      --cluster demo \
      --service-name demo-service-test \
      --task-definition demo \
      --desired-count 1 \
      --launch-type FARGATE \
      --platform-version LATEST \
      --network-configuration '{"awsvpcConfiguration":{"subnets":["subnet-a510e78e"],"securityGroups":["sg-0f73c052e6a8549f7"],"assignPublicIp":"ENABLED"}}' \
      --load-balancers '{"targetGroupArn":"arn:aws:elasticloadbalancing:ap-northeast-1:294437145362:targetgroup/ecs-demo-service/82131714021d4d77","containerName":"demo-container","containerPort":8000}' \
      --health-check-grace-period-seconds 60 \
      --region ap-northeast-1
}

create_dev_ECS_Service(){
    echo "Create ECS service for development"
    aws ecs create-service \
      --cluster demo \
      --service-name demo-service-dev \
      --task-definition demo \
      --desired-count 1 \
      --launch-type FARGATE \
      --platform-version LATEST \
      --network-configuration '{"awsvpcConfiguration":{"subnets":["subnet-a510e78e"],"securityGroups":["sg-0f73c052e6a8549f7"],"assignPublicIp":"ENABLED"}}' \
      --load-balancers '{"targetGroupArn":"arn:aws:elasticloadbalancing:ap-northeast-1:294437145362:targetgroup/ecs-demo-service/82131714021d4d77","containerName":"demo-container","containerPort":8000}' \
      --health-check-grace-period-seconds 60 \
      --region ap-northeast-1
}

"$@"