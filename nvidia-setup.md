
### nvidia-driver setup
```bash
nvidia-smi

# Check if the NVIDIA GPU is Detected
lspci | grep -i nvidia

# Check Driver Installation, get major version.
# H100(80GB, second ver): ver=570
nvidia-detector
# or
cat /proc/driver/nvidia/version
# or
modinfo nvidia | grep version


# setup nvidia driver( ex:sudo apt install nvidia-driver-575)
sudo apt update
sudo apt install nvidia-driver-<version> nvidia-utils-<version>

```