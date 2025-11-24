.PHONY: help build deploy

ZIPFILE=deployment_package.zip
SCRIPT=format_message.sh
INPUT=message_input.txt
README=README.md

help:
        @echo "Victoria Singharaj"
        @echo "To build the deployment package, run: make build"
        @echo "To deploy the package to the git repository, run: make deploy"

build: $(ZIPFILE)

$(ZIPFILE): $(SCRIPT) $(INPUT) $(README)
        zip -r $(ZIPFILE) $(SCRIPT) $(INPUT) $(README)

deploy: build
        git add $(ZIPFILE)
        git commit -m "Deploy $(ZIPFILE)"
        git push
