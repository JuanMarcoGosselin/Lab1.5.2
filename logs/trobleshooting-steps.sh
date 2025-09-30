Issue 1: Service Failure (Apache2)
Symptom: systemctl status apache2 showed a failure after configuration file was renamed.
Diagnosis: Error logs in journalctl -u apache2 indicated missing /etc/apache2/apache2.conf.
Resolution:
sudo mv /etc/apache2/apache2.conf.backup /etc/apache2/apache2.conf
sudo systemctl start apache2
Verification:
systemctl status apache2
curl localhost
Apache2 started successfully and responded to HTTP requests.
Issue 2: Custom Service Debugging
Symptom: simple-service.service failed to start on first attempt.
Diagnosis: Log check with journalctl -xeu simple-service revealed missing execution permissions.
Resolution:
chmod +x /home/$USER/simple-service.sh
sudo systemctl daemon-reload
sudo systemctl start simple-service
Verification:
systemctl status simple-service
tail -f /tmp/simple-service.log
Service started successfully and produced log entries
