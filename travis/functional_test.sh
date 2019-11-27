#!/bin/bash

URL="http://demo-1046280049.ap-northeast-1.elb.amazonaws.com:8787/health_check"
status_of_test_dev=$(aws ecs describe-services --services demo-service-test --cluster demo --region ap-northeast-1 --query 'services[0].status')
status_of_elb=$(aws elbv2 describe-load-balancers --names demo --region ap-northeast-1 --query 'LoadBalancers[0].State.Code')

echo "Check ELB status"
count_status_of_elb=0
until [ "$status_of_elb" = "\"active"\" ]
do
    sleep 5
    status_of_elb=$(aws elbv2 describe-load-balancers --names demo --region ap-northeast-1 --query 'LoadBalancers[0].State.Code')
    (( count_status_of_elb += 1 ))
    if [ "$count_status_of_elb" = 12 ];then
        echo "ELB status is abnormal"
        exit 1
    fi
done

echo "Check ECS status"
count_status_of_test_dev=0
until [ "$status_of_test_dev" = "\"ACTIVE"\" ]
do
    sleep 5
    status_of_test_dev=$(aws ecs describe-services --services demo-service-test --cluster demo --region ap-northeast-1 --query 'services[0].status')
    (( count_status_of_test_dev += 1 ))
    if [ "$count_status_of_test_dev" = 12 ];then
        echo "ECS build failed"
        exit 1
    fi
done

echo "Start Functional Tests";
count_status_code=0
until [ "$status_code" = 200 ]
do
    sleep 5
    status_code=$(curl --write-out %{http_code} --silent --output /dev/null $URL)
    (( count_status_code += 1 ))
    if [ "$count_status_code" = 12 ];then
        echo "Python runserver failed"
        exit 1
    fi
done

HTTP_RESPONSE=$(curl --silent --write-out "HTTPSTATUS:%{http_code}" -X GET $URL);
HTTP_BODY=$(echo $HTTP_RESPONSE | sed -e 's/HTTPSTATUS\:.*//g');
HTTP_STATUS=$(echo $HTTP_RESPONSE | tr -d '\n' | sed -e 's/.*HTTPSTATUS://');

if [ "$HTTP_BODY" = "ok" ];then
    echo "Functional test successed"
else
    echo "Functional test failed"
    exit 1
fi