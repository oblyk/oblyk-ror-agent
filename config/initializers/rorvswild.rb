# frozen_string_literal: true

if ENV.fetch('ENABLE_ROR_WS_WILD', false) == 'true'
  RorVsWild.start api_key: ENV['ROR_WS_WILD_API_KEY']
  RorVsWild.agent.queue.instance_variable_get(:@metrics).update
  RorVsWild.agent.queue.start_thread
end
