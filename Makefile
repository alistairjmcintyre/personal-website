image:
	docker build -t resume-builder:latest .

resume_dev:
	docker run -v ${PWD}:/app -e PATH="${PATH}:/app/node_modules/.bin" -w /app resume-builder:latest relaxed --no-sandbox resume.pug

web_dev:
	docker run -v ${PWD}:/app -e PATH="${PATH}:/app/node_modules/.bin" -w /app resume-builder:latest pug --watch index.pug