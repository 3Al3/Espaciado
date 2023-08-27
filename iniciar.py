from datetime import date
from datetime import timedelta
import subprocess
import os

def probando(fecha):
    carpetaDelMes = fecha.strftime("%Y-%m")
    diaDeHoy = fecha.strftime("%d")


    carpetaFinal = subprocess.check_output(f"cd {carpetaDelMes}/{diaDeHoy}/ && pwd",shell=True, text=True).split()
    carpetaOrigen = subprocess.check_output("cd hoy/ && pwd",shell=True, text=True).split()

    os.system(f"cp -r {carpetaOrigen[0]}* {carpetaFinal[0]}")




if __name__ == "__main__":
    hoy = date.today()
    primer_salto = hoy + timedelta(days=1)
    segundo_salto= primer_salto + timedelta(days=5)
    tercer_salto = segundo_salto + timedelta(days=28)

    periodos = [primer_salto,segundo_salto,tercer_salto]
    
    
    for i in range((len(periodos))):
        probando(periodos[i])

    print("#"*10)
    print("Terminado")
    print("#"*10)
    
    
    
    
