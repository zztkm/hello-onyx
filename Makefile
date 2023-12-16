.PHONY: run
run:
	onyx run main.onyx

.PHONY: build
build:
	onyx build main.onyx

.PHONY: wasi
wasi:
	onyx build --runtime wasi -o wasi.wasm main.onyx 

.PHONY: wasix
wasix:
	onyx build main.onyx -r wasi -DWASIX -o wasix.wasm

.PHONY: run-wasix
run-wasix: wasix
	wasmer run --net wasix.wasm

.PHONY: clean
clean:
	rm *.wasm