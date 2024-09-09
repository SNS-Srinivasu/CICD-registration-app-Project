# ---------Continuous Integration (CI) Pipeline------------


# Pipeline Overview

 Agent: Runs in EC2 Jenkins agent.
 
 Tools: Configures JDK 17 and Maven 3 for the build.
 
# Environment Variables

1. APP_NAME: Name of the application.
2. RELEASE: Release version.
3. DOCKER_USER: Docker Hub username.
4. DOCKER_PASS: Docker Hub password.
5. IMAGE_NAME: Docker image name.
6. IMAGE_TAG: Docker image tag.
7. JENKINS_API_TOKEN: Jenkins API token for secure operations.
   
# Pipeline Stages

1. Clean Workspace: Cleans the workspace before each build.
2. Checkout: Checks out the source code from GitHub.
3. Build Application: Builds the application with Maven.
4. Test Application: Runs tests on the application.
5. SonarQube Analysis: Performs static code analysis.
6. Quality Gate: Checks SonarQube quality gate status.
7. Build & Push Docker Image: Builds and pushes the Docker image.
8. Trivy Scan: Scans the Docker image for vulnerabilities.
9. Cleanup Artifacts: Removes Docker images from the local system.
10. Trigger CD Pipeline: Triggers a Continuous Deployment pipeline.
    
# Post Actions

1. Success: Logs a success message.
2. Failure: Logs a failure message.
3. Always: Logs a completion message.


# ----------Continuous Deployment (CD) Pipeline------------

# Pipeline Stages

1. Cleanup Workspace:
    * Ensures a fresh environment by cleaning up previous workspace files and artifacts.
2. Checkout from SCM:
    * Retrieves the latest code from the GitHub repository  using the main branch and specified credentials.
3. Update the Deployment Tags:
    * Updates the deployment.yaml file with the new application version or tag. The sed command is used to replace the old tag with the new one.
4. Push the Changed Deployment File to Git:
    * Configures Git with user details, commits the updated deployment.yaml file, and pushes the changes to the GitHub repository.

