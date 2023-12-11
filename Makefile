.PHONY: run
run:
	onyx run main.onyx

.PHONY: build
build:
	onyx build main.onyx

.PHONY: wasi
wasi:
	onyx build --runtime wasi -o wasi.wasm main.onyx 
