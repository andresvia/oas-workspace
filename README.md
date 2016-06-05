# OAS Workspace

Crea un ambiente de trabajo estándar para la OAS usando Vagrant.

## Preparaciones

Lee guías en Internet sobre como crear tu llave de GPG, y cómo crear un par de llaves de SSH. El archivo `~/.rpmmacros` es necesario para firmar digitalmente los paquetes que desarrolles, el contenido inicial podría ser.

```
%_signature gpg
%_gpg_name  El Nombre Que Utilizaste Mientras Creabas Tu Llave GPG
```

**Happy Coding!**

## ¿Cómo usar esto?

Simplemente ejecuta:

```
./enter
```

Para subir y entrar a tu VM.

```
vagrant ssh
```

Para entrar por SSH a tu VM.

```
vagrant destroy
```

Para borrar tu VM.

```
vagrant provision
```

Para actualizar tu VM.

```
vagrant reload
```

Para reiniciar tu VM.

Lee más sobre Vagrant en https://www.vagrantup.com/

## Acceso a tu VM

Accede a tu VM por medio de la dirección => `NOMBRE_DE_USUARIO.192.168.12.37.xip.io`

## Contribuciones

 - Pull requests son bienvenidos
