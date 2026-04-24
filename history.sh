@Joselyn-uide ➜ /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/evaluation/kepler (eval_p2_1_g2) $ history
    1  git fetch upstream
    2  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    3  git push origin eval_p2_1_g2
    4  git push - origin eval_p2_1_g2
    5  pwd
    6  whoami
    7  ls -la
    8  cd kepler/
    9  cd evaluation/
   10  cd kepler/
   11  ls -F
   12  mv docs registros
   13  mkdir plantillas
   14  ls -F
   15  git add .
   16  git commit -m "Fix problema 1: estructura de directorios corregida"
   17  ls -R
   18  mv sensores.log registros/
   19  mv ajustes.old ajustes.conf
   20  ls -F registros/
   21  ls -F ajustes.conf
   22  git add .
   23  git commit -m "Fix problema 2: archivos movidos y renombrados"
   24  ls -l registros/sensores.log
   25  chmod 600 registros/sensores.log
   26  ls -l registros/sensores.log
   27  git add .
   28  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   29  ls -l registros/sensores.log
   30  history


#Fix issue 5: SUID enabled in runner.sh

    37  ls -l runner.sh
   38  chmod u+s runner.sh
   39  ls -l runner.sh
   40  git add .
   41  git commit -m "Fix issue 5: SUID enabled in runner.sh"
   42  history