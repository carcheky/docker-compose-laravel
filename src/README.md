<p align="center">
    <img src="https://i.postimg.cc/GpMQ3bj2/68747470733a2f2f692e706f7374696d672e63632f765a623674706e772f53637265656e2d53686f742d323032312d31302d.png" alt="UNIT3D-Community-Edition Cover Image">
</p>

<a href=https://github.com/sponsors/HDVinnie>
<p align="center">
    <img src="https://i.postimg.cc/QMRRNgmV/support.png" alt="UNIT3D-Community-Edition Support Image">
</p>
</a>

<p align="center">
    🎉<b>A Big Thanks To All Our <a href="https://github.com/HDInnovations/UNIT3D-Community-Edition/graphs/contributors">Contributors</a> and <a href="https://github.com/sponsors/HDVinnie">Sponsors</a></b>🎉
</p>

<hr>

<p align="center"><b>NOTE: This only works for a fresh server with nothing on it but a new OS install!</b></p>

## This Repository
Installer for the [UNIT3D-Community-Edition](https://github.com/HDInnovations/UNIT3D-Community-Edition).

**NOTE: If you are running UNIT3D-Community-Edition on a non HTTPS instance you MUST change the following configs.**
```
.env  <-- SESSION_SECURE_COOKIE must be set to false
config/secure-headers.php   <-- HTTP Strict Transport Security must be set to false
config/secure-headers.php   <-- Content Security Policy must be disabled
```

**Officially Supported OS's**
- Ubuntu 22.04 LTS (Jammy Jellyfish)
- Ubuntu 20.04 LTS (Focal Fossa)

**To install run the following:**
```
git clone https://github.com/HDInnovations/UNIT3D-Installer.git installer
cd installer
sudo ./install.sh
```

### Suggestions and/or Bug Reporting
We encourage the use of [GitHub Issues](https://github.com/HDInnovations/UNIT3D-INSTALLER/issues/new)!
