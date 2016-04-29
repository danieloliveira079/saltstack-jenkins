danieloliv/jenkins-android:latest:
  dockerng.image_present

docker-api-service:
  dockerng.running:
    - name: jenkins-android
    - image: danieloliv/jenkins-android:latest
    - binds:
      - /data/jenkins_home:/var/jenkins_home
    - port_bindings:
      - 8080:8080
    - restart_policy: always
    - working_dir: /var/jenkins_home
    - force: True
