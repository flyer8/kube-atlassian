Single commands for Docker
```
docker run -v bitbucketVolume:/var/atlassian/application-data/bitbucket \
--name="bitbucket" -d -p 7990:7990 -p 7999:7999 \
atlassian/bitbucket-server
```
```
docker run -d -p 8085:8085 \
-v bambooVolume:/var/atlassian/bamboo \
-v bambooVolumeLogs:/opt/atlassian/bamboo/logs \
--name bamboo \
flyer8/atlassian-bamboo-mvn
```
```
docker run -d -p 8080:8080 \
-v jiraVolume:/var/atlassian/jira \
-v jiraVolumeLogs:/opt/atlassian/jira/logs \
--name jira \
cptactionhank/atlassian-jira:latest
```
```
docker run -d -p 8090:8090 \
-v confluenceVolume:/var/atlassian/confluence \
-v confluenceVolumeLogs:/opt/atlassian/confluence/logs \
--name confluence \
cptactionhank/atlassian-confluence:latest
```
