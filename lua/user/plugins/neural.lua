local status_ok, neural = pcall(require, "neural")
if not status_ok then
  return
end

local OPEN_API_KEY = os.getenv("OPENAI_API_KEY")

neural.setup({
  mappings = {
    swift = '<C-n>', -- Context completion
    prompt = '<C-o>', -- Open prompt
  },
  -- OpenAI settings
  open_ai = {
    temperature = 0.1,
    presence_penalty = 0.5,
    frequency_penalty = 0.5,
    max_tokens = 2048,
    context_lines = 16, -- Surrounding lines for swift completion
    api_key = OPEN_API_KEY,
  },
  -- Visual settings
  ui = {
    use_prompt = true, -- Use visual floating Input
    use_animated_sign = true, -- Use animated sign mark
    show_hl = true,
    show_icon = true,
    icon = '🗲', -- Prompt/Static sign icon
    icon_color = '#ffe030', -- Sign icon color
    hl_color = '#4D4839', -- Line highlighting on output
    prompt_border_color = '#E5C07B',
  },
})
