# CEG 3120 - Project 4 

## Project Overview

This project had two different components. The Milestone1, “Dockerize it”, had us dockerizing an html file. The next milestone, “Github Actions and ECR” had us configure AWS CLI, create an ECR repositoty, and create GitHub actions to be used with a workflow that pushed an image to ECR. The workflow template was provided to us, however, changes did need made. Overall, that is where the project stopped due to problems with AWS accounts the Educate version. Milestone 3 is the below documentation.

## Documentation

### Milestone 1:

To start the project, I first had to complete the setup. First step was to install docker from the following link: [https://www.docker.com/products/docker-desktop]

After installing Docker, I realized that I had the wrong version of WSL. I was on WSL Version 1. I had to run the following command to switch to WSL2:

	wsl --set-default-version 2

Because of this I had to uninstall Docker, reinstall Docker, and do a manual restart of my machine (because for some reason, the second time through it did not prompt me for a restart and it clearly wasn’t working). Once Docker was installed, I tested Docker by doing: 

	docker run -d -p 80:80 docker/getting-started

We also had to use apache2 for this as mentioned in the Lecture on 04-02-2021, but I do this later (since it auto-installs it if you don’t select the base container from hub.docker.com). 

Next, I had to make the new repo in the GitHub using the link in Pilot. Then, I had to clone the newly created repository to my local WSL 2:

	git clone https://github.com/WSU-kduncan/ceg3120-p4-massa-michelle.git

After I cloned the repo, I created this README.md file and committed it to my repo. This proved that everything was working as it should be. Next, I made an html directory:

	mkdir html

I then created my index.html file here, and then setup docker for the project: 

	vim Dockerfile 

I put the following in that Dockerfile:

	FROM httpd:2.4
	# where from on my machine and where to on the computer
	COPY ./html/ /usr/local/apache2/htdocs/

Then I did a build:

	docker build -t project4_test2 .

and a:

	docker run -d -p 80:80 project4_test2

My site was now accessible at: `http://127.0.0.1/index.html`

### Milestone 2:

The next part of the project required that I had AWS CLI. I ran the following commands to setup the AWS CLI on my local machine:

	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo apt install unzip
	unzip awscliv2.zip
	sudo ./aws/install
	mkdir .aws
	cd .aws

Next I needed to create the config and credentials files:

	vim config
	vim credentials

I am not going to put what I put inside those files here, but the info is on Pilot.

Next, I needed to create my ECR repository:

	aws ecr create-repository --repository-name ceg3120/w090mcm --region us-east-1

Next, I needed to configure my GitHub Secrets. This was easy and was covered in the lectures (you go into GitHub, go to settings, and then secrets, and enter the keys there). 

Inside this repo (that I am typing into now), I created the `.github` directory

	mkdir .github

I then created the `workflows` directory:

	mkdir workflows
	vim docker-to-ecr-to-ecs.yml

My yaml file can be found [here](.github/workflows/docker-to-ecr-to-ecs.yml).

And that is pretty much everything for the project!

## Lessons Learned:

Biggest lesson I learned is that I should have documented my progress more as I did this project. I completed Milestone 1 and 2 before the due dates and did not really know where the project was going. At the time, I thought it would be easier to document my process later as the project came together… turns out that was a horrible idea. The `history` command and being able to re-watch the lectures really saved me on this one. I have learned my lesson: _*DOCUMENT EVERYTHING*_.





