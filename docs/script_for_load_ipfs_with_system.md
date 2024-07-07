# Setting Up IPFS to Start Automatically on System Boot with systemd

This guide explains how to configure IPFS to start automatically when your Linux system boots using `systemd`.

## Prerequisites

- IPFS installed on your system
- A user account that has initialized IPFS

## Steps

### 1. Create a systemd Service File

First, create a new service file for IPFS in the `/etc/systemd/system` directory.

```sh
sudo nano /etc/systemd/system/ipfs.service
```

### 2. Add the Service Configuration

Add the following configuration to the `ipfs.service` file. Ensure that the path to the IPFS binary is correct and replace `YOUR_USERNAME` with your actual username.

```ini
[Unit]
Description=IPFS daemon
After=network.target

[Service]
User=YOUR_USERNAME
ExecStart=/usr/local/bin/ipfs daemon
Restart=on-failure
RestartSec=10
LimitNOFILE=10240

[Install]
WantedBy=multi-user.target
```

### 3. Reload systemd

Reload the systemd manager configuration to include the new service file.

```sh
sudo systemctl daemon-reload
```

### 4. Enable the IPFS Service

Enable the IPFS service to start automatically on boot.

```sh
sudo systemctl enable ipfs
```

### 5. Start the IPFS Service

Start the IPFS service immediately.

```sh
sudo systemctl start ipfs
```

### 6. Verify the Service Status

Check the status of the IPFS service to ensure it is running correctly.

```sh
sudo systemctl status ipfs
```

You should see an output indicating that the IPFS daemon is active and running.

## Summary of Commands

Here is a summary of the commands you need to execute:

1. Create the service file:

    ```sh
    sudo nano /etc/systemd/system/ipfs.service
    ```

2. Add the following content to the file:

    ```ini
    [Unit]
    Description=IPFS daemon
    After=network.target

    [Service]
    User=YOUR_USERNAME
    ExecStart=/usr/local/bin/ipfs daemon
    Restart=on-failure
    RestartSec=10
    LimitNOFILE=10240

    [Install]
    WantedBy=multi-user.target
    ```

3. Reload systemd:

    ```sh
    sudo systemctl daemon-reload
    ```

4. Enable the IPFS service:

    ```sh
    sudo systemctl enable ipfs
    ```

5. Start the IPFS service:

    ```sh
    sudo systemctl start ipfs
    ```

6. Verify the service status:

    ```sh
    sudo systemctl status ipfs
    ```

By following these steps, IPFS will be configured to start automatically whenever your Linux system boots up.
```

Replace `YOUR_USERNAME` with your actual username and ensure the path to the IPFS binary (`/usr/local/bin/ipfs`) is correct. This guide should help users set up IPFS to start automatically on system boot using `systemd`.