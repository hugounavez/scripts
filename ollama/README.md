# Custom Ollama Model Preset (CPU-Optimized for Intel MacBook Pro 2019)

This guide shows how to create and use a personalized preset of `llama3:latest` optimized for a **Not so new personal computer**.

---

## 1) Create a `Modelfile`

Create a file named exactly `Modelfile` (no extension) with:

```txt
FROM llama3:latest

PARAMETER num_thread 12
PARAMETER num_gpu 0

PARAMETER num_ctx 8192
PARAMETER num_keep 24

PARAMETER temperature 0.7
PARAMETER top_p 0.9
PARAMETER top_k 40
PARAMETER repeat_penalty 1.1
PARAMETER repeat_last_n 256
PARAMETER num_predict -1

PARAMETER stop <|start_header_id|>
PARAMETER stop <|end_header_id|>
PARAMETER stop <|eot_id|>
```

### Notes

- **num_thread**: can be tuned 10–14 depending on responsiveness
- **num_gpu 0**: AMD GPUs are not supported by Ollama, so CPU-only
- **num_ctx**: use 4096 instead of 8192 if you prefer speed over context

## 2) Create the model from the Modelfile

```bash
ollama create llama3-optimized -f Modelfile
```

To update it later, remove & re-create:

```bash
ollama rm llama3-optimized
ollama create llama3-optimized -f Modelfile
```

## 3) Run your optimized model

```bash
ollama run llama3-optimized
```

## 4) Override parameters temporarily (without editing Modelfile)

### In REPL

```
/set parameter temperature 0.3
/set parameter num_thread 10
```

### Via API

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "llama3-optimized",
  "prompt": "hello",
  "options": { "temperature": 0.3, "num_thread": 10 }
}'
```

## Additional presets

You can create multiple presets with different Modelfiles, e.g.:

- **llama3-fast** — lower context (4096) and fewer threads
- **llama3-analysis** — lower temperature and higher repeat penalty
- **llama3-long** — large context (16384+)
- **llama3-coding** — deterministic / low randomness profile

Ask the model to create additional Modelfiles with new names if needed.
