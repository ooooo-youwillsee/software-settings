
# configService
docker run -p 8080:8080 \
    -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql-standalone:3306/ApolloConfigDB?characterEncoding=utf8&serverTimezone=UTC&serverTimezone=Asia/Shanghai" \
    -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=root  \
    --link mysql-standalone:mysql-standalone  \
    -d --name apollo-configservice-standalone apolloconfig/apollo-configservice:latest


# adminService
docker run -p 8090:8090 \
    -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql-standalone:3306/ApolloConfigDB?characterEncoding=utf8&serverTimezone=Asia/Shanghai" \
    -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=root \
    -e EUREKA_SERVICE_URL=http://apollo-configservice-standalone:8080/eureka/ \
    --link apollo-configservice-standalone:apollo-configservice-standalone  \
    --link mysql-standalone:mysql-standalone  \
    -d --name apollo-adminservice-standalone apolloconfig/apollo-adminservice:latest


# portalService
docker run -p 8070:8070 \
    -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql-standalone:3306/ApolloPortalDB?characterEncoding=utf8&serverTimezone=Asia/Shanghai" \
    -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=root \
    -e APOLLO_PORTAL_ENVS=dev \
    -e DEV_META=http://172.17.0.3:8080 \
    --link apollo-configservice-standalone:apollo-configservice-standalone  \
    --link mysql-standalone:mysql-standalone  \
    -d --name apollo-portal-standalone apolloconfig/apollo-portal:latest
