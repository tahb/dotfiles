export default function(api) {
  api.registerProvider("ollama", {
    baseUrl: "http://localhost:11434/v1",
    apiKey: "ollama",
    models: [{ id: "gemma4-12b-32k", api: "openai-completions", contextWindow: 32768, maxTokens: 4096, input: ["text"] }]
  });
}
