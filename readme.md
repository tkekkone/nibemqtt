Uses mbpoll to fetch values from nibe heat pump. Tried with vvm320. Poll.txt contains addresses with divider values and names to publish to mqtt. getaddress.sh is called by execute.sh. Execute.sh also reads the polls.txt and runs forever in period of POLL_TIME env value. Uses other env values too.

Build docker image:

`docker build -t mbpoll`

Run with env configs
`docker run -e MQTT_HOST="mosquitto" -e MQTT_PORT=1883 -e NIBEHOST="nibe" -e POLLTIME=30 mdpoll`
