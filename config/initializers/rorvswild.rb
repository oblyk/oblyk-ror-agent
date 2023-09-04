# frozen_string_literal: true

RorVsWild.start(api_key: ENV['ROR_WS_WILD_API_KEY'])
RorVsWild.agent.queue.start_thread
