class StreamController < ApplicationController
  include ActionController::Live

  def live
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Connection'] = 'keep-alive'

    sse = SSE.new(response.stream, retry: 300, event: 'video_stream')

    video_path = 'path_to_your_video.mp4' # Replace with the actual path to your video file

    begin
      File.open(video_path, 'rb') do |file|
        while (data = file.read(1024)) # Read video data in chunks
          sse.write(data, event: 'video_frame')
        end
      end
    rescue ActionController::Live::ClientDisconnected
      logger.info 'Client Disconnected'
      sse.close
      response.stream.close
    rescue IOError
      logger.info 'IOError'
      sse.close
      response.stream.close
    ensure
      sse.close
      response.stream.close
    end
  end
end