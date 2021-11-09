require 'aws-sdk-sqs'
require 'aws-sdk-sts'
require 'sinatra'

ENDPOINT_URL='http://localstack:4566'
QUEUE_NAME='messages'
QUEUE_URL="#{ENDPOINT_URL}/000000000000/#{QUEUE_NAME}"

Aws.config.update(
  region: 'ap-northeast-1',
  credentials: Aws::Credentials.new('akid', 'secret')
)

sqs_client = Aws::SQS::Client.new(endpoint: ENDPOINT_URL)
sqs_client.create_queue(queue_name: QUEUE_NAME)

get '/' do
  @urls = sqs_client.list_queues.queue_urls
  @messages = sqs_client.receive_message(
    queue_url: QUEUE_URL,
    max_number_of_messages: 10,
    visibility_timeout: 0,
  ).messages

  erb :index
end

post '/greet' do
  sqs_client.send_message(
    queue_url: QUEUE_URL,
    message_body: params[:message]
  )

  erb :greet
end