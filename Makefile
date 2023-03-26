STRIPE_SECRET=sk_test_51MpkiPC7ZLr60hK9xx4ywRYyXRxWLMgJntqcCS8zkxS5LIzUiTy4hq5pkNJk9jbtRxmIwPVYXpyVAqlL77AezWDW006E3qGY6F
STRIPE_KEY=pk_test_51MpkiPC7ZLr60hK9yxTZXJzlETqQendmTJaMclQO4AEiFIvmV2k9WCNcVSQdw69uXlXoWcwjqSfSlZbmLsiisiVK00U1fN1bG5
GOSTRIPE_PORT=4000
API_PORT=4001


## build: builds all binaries
build: clean build_front build_back
	@printf "All binaries built!\n"

## clean: cleans all binaries and runs go clean
clean: 
	@echo "Cleaning..."
	@- rm -f dist/*
	@go clean
	@echo "Cleaned!"

## build_front: builds the front end
build_front:
	@echo "Building front end..."
	@go build -o dist/gostripe ./cmd/web
	@echo "Front end built!"

## build_back: builds the back end
build_back:
	@echo "Building back end..."
	@go build -o dist/gostripe_api ./cmd/api
	@echo "Back end built!"

## start: starts front and back end
start: start_front start_back

## start_front: starts the front end
start_front: build_front
	@echo "Starting the front end..."
	@env STRIPE_KEY=${STRIPE_KEY} STRIPE_SECRET=${STRIPE_SECRET} ./dist/gostripe -port=${GOSTRIPE_PORT} &
	@echo "Front end running!"

## start_back: starts the back end
start_back: build_back