# Script para ver cambios en tiempo real
while ($true) {
    Clear-Host
    
    # Sincronizar con el repositorio
    Write-Host "Sincronizando con el repositorio..."
    git pull
    Write-Host ""
    
    # Mostrar estado del repositorio
    Write-Host "Estado actual del repositorio:"
    git status
    Write-Host ""
    
    # Mostrar últimos cambios
    Write-Host "Últimos cambios:"
    git log -n 3 --oneline
    Write-Host ""
    
    # Mostrar cambios en los archivos
    Write-Host "Cambios en los archivos:"
    git diff --name-only
    Write-Host ""
    
    # Mostrar contenido de los archivos modificados
    $modifiedFiles = git diff --name-only
    if ($modifiedFiles) {
        Write-Host "Contenido de archivos modificados:"
        foreach ($file in $modifiedFiles) {
            Write-Host "`nArchivo: $file"
            Get-Content $file
            Write-Host "-" * 50
        }
    }
    
    # Mostrar contenido de los archivos principales
    Write-Host "`nContenido de archivos principales:"
    $mainFiles = Get-ChildItem -Path . -Include *.html,*.css,*.js -Recurse | Select-Object -ExpandProperty FullName
    foreach ($file in $mainFiles) {
        Write-Host "`nArchivo: $file"
        Get-Content $file
        Write-Host "-" * 50
    }
    
    Start-Sleep -Seconds 5
}
