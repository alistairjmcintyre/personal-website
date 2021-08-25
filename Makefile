image:
	docker build -t resume-builder:latest .

get_deps:
	docker run -v ${PWD}:/app -w /app resume-builder:latest npm install

resume_dev:
	docker run -v ${PWD}:/app -e PATH="${PATH}:/app/node_modules/.bin" -w /app resume-builder:latest relaxed --no-sandbox resume.pug

web_dev:
	docker run -v ${PWD}:/app -e PATH="${PATH}:/app/node_modules/.bin" -w /app resume-builder:latest pug --watch index.pug

web_deploy:
	docker run -v ${PWD}:/app -e PATH="${PATH}:/app/node_modules/.bin" -w /app resume-builder:latest pug index.pug

resume_deploy:
	docker run -v ${PWD}:/app -e PATH+"${PATH}:/app/node_modules/.bin" -w /app resume-builder:latest /app/node_modules/.bin/relaxed --no-sandbox --build-once resume.pug