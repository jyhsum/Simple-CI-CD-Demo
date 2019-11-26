#!/bin/bash

create_test_ECS_Service(){
    echo "Create ECS service for functional test"
    aws ecs create-service \
      --cluster demo \
      --service-name service-for-demo \
      --task-definition demo \
      --desired-count 1 \
      --launch-type FARGATE \
      --platform-version LATEST \
      --network-configuration '{"awsvpcConfiguration":{"subnets":["subnet-0be34124c9a3defec"],"securityGroups":["sg-0c86e8e017fbe6d20"],"assignPublicIp":"ENABLED"}}' \
      --load-balancers '{"targetGroupArn":"arn:aws:elasticloadbalancing:ap-northeast-1:889231634371:targetgroup/ecs-functional-test-service/d9452ac29980622c","containerName":"dev-container","containerPort":8080}' \
      --health-check-grace-period-seconds 60 \
      --region ap-northeast-1
}

create_dev_ECS_Service(){
    echo "Create ECS service for development"
    aws ecs create-service \
      --cluster writepath-dev \
      --service-name service-dev \
      --task-definition writepath-dev \
      --desired-count 1 \
      --launch-type FARGATE \
      --platform-version LATEST \
      --network-configuration '{"awsvpcConfiguration":{"subnets":["subnet-0be34124c9a3defec"],"securityGroups":["sg-0c86e8e017fbe6d20"],"assignPublicIp":"ENABLED"}}' \
      --load-balancers '{"targetGroupArn":"arn:aws:elasticloadbalancing:ap-northeast-1:889231634371:targetgroup/ecs-writep-service-dev/39c63b9d1d62d0bf","containerName":"dev-container","containerPort":8080}' \
      --health-check-grace-period-seconds 60 \
      --region ap-northeast-1;
}

"$@"