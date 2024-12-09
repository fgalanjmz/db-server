## Quiniela_DB

### Construccion

Usa Docker desktop para construir el contenedor que tendra la BD QUINIELA

Una vez que el contenedor esta corriendo

1. Copiar los procedimientos de administracion de respaldos
2. Conectarse con SQL Server manager Studio
3. Compilar los procedimientos almacendos

### Acceso

Para acceder al servidor SQL Server usar la cadena de coneccion

```bash
https://miservidor
```
### Respaldos

Para descargar los respaldos 

1. Iniciar Docker desktop
2. Copiar el archivo del respaldo
   Renombrar el archivo respaldo.latest con un identificador unico, se sugiere usar la fecha y hora de la descarga
```bash
pushd ~/mis-respaldos
docker copy https://miservidor:/tmp/respaldos/quiniela.latest.dmp ./quiniela.241202_151824.dmp
popd
```
3. Almacenarlo en un repositorio seguro. Se sugiere hacer dos copias en dispositivos diferentes

Para restaurar un respaldo anterior

1. Iniciar Docker desktop
2. Copiar el archivo del respaldo, ejemplo quiniela.241202_151824.dmp
```bash
pushd ~/mis-respaldos
docker copy  quiniela.241202_151824.dmp https://miservidor:/tmp/respaldos/quiniela.241202_151824.dmp
popd
```
3. Usando SQL Server Manager Conectarse a la base de datos Quiniela

4. Ejecutar el stores procedure de resuperacion
```SQL
exec sp_restaura_bd /respaldos/tmp/quiniela.241202_151824.dmp
mv quiniela.latest.dmp quiniela.241202_151824.dmp
popd
```
5. Verificar que la base de datos esta en linea






