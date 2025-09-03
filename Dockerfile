# FROM : 시작할 이미지파일을 지정한다. 일반적으로는 OS 이미지를 지정
# 로컬에 해당 파일이 있다면 그 파일을 사용하고 없다면 Docker hub에서 이미지를 가져온다.
FROM node:20-slim

# WORKDIR : cd 명령어와 비슷하다. 해당 경로로 이동하는 명령어.
WORKDIR /app

# COPY A B : A경로에 있는 파일을 이미지파일 내의 B경로로 복사한다. 현재 경로는 app이므로 app폴더내에 복사가 된다.
# dockerignore 파일로 복사하지 않을 파일을 지정할 수 있다.
COPY . .

# RUN : 명령어를 실행한다.
# package.json을 통해 설치한다.
# RUN npm install 처럼 대괄호 없이 사용도 가능하지만 shell을 사용하게되어 호환성 문제가 생길 수 있다.
RUN ["npm", "install"]

# EXPOSE : 이 가상 컴퓨터에서 열어둘 포트 번호를 지정한다.
EXPOSE 8080

# 마지막 명령어는 CMD를 사용한다. (국룰임) CMD에 있는 내용은 도커 이미지 실행시 커스텀이 가능하다.
# 마지막 명령어에는 ENTRYPOINT도 사용할 수 있다. CMD와는 다르게 수정이 어려워서 안정적인 편이다.
CMD ["node", "server.js"]