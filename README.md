# RemocalStack
This is a PoC repo for running a sample application with LocalStack on "remote" (GitHub Codespaces).

## Getting Started
1. Fork this repo
2. Open this project in a codespace
3. Start the app from terminal in a codespace (start command: `bundle exec ruby app/app.rb -o 0.0.0.0`)
4. Click "Open in Browser" popup in a codespace
5. Send a message to a SQS queue and see messages in the queue from the app UI

## Architecture
<img src="https://docs.github.com/assets/images/help/codespaces/port-forwarding.png">

See [Deep dive into Codespaces](https://docs.github.com/en/codespaces/getting-started/deep-dive) for the details.