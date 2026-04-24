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

   #Fix problema 6: sticky bit en /tmp/kepler_zone
    50  ls -ld /tmp/kepler_zone
   51  sudo mkdir /tmp/kepler_zone
   52  sudo chmod 777 /tmp/kepler_zone
   53  ls -ld /tmp/kepler_zone
   54  sudo chmod +t /tmp/kepler_zone
   55  ls -ld /tmp/kepler_zone
   56  git add .
   57  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"
   58  history


   #full history
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
   31  ls -l runner.sh ajustes.conf
   32  chmod u+x runner.sh
   33  chmod o-w ajustes.conf
   34  ls -l runner.sh ajustes.conf
   35  git add .
   36  git commit -m "Fix problem 4: symbolic permissions corrected"
   37  ls -l runner.sh
   38  chmod u+s runner.sh
   39  ls -l runner.sh
   40  git add .
   41  git commit -m "Fix issue 5: SUID enabled in runner.sh"
   42  history
   43  git push --all
   44  git branch -a
   45  history
   46  git push -u origin eval_p2_1_g2 
   47  sudo apt update && sudo apt install git-lfs
   48  git lfs install
   49  git push -u origin eval_p2_1_g2
   50  ls -ld /tmp/kepler_zone
   51  sudo mkdir /tmp/kepler_zone
   52  sudo chmod 777 /tmp/kepler_zone
   53  ls -ld /tmp/kepler_zone
   54  sudo chmod +t /tmp/kepler_zone
   55  ls -ld /tmp/kepler_zone
   56  git add .
   57  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"
   58  history
   59  gpg --full-generate-key
   60  gpg --encrypt --recipient vega@kepler.lab kepler/registros/sensores.log
   61  ls kepler/registros/
   62  gpg --encrypt --recipient vega@kepler.lab registros/sensores.log
   63  ls -l registros/
   64  git add .
   65  git commit -m "Fix problema 7: llave GPG generada y sensores.log cifrado"
   66  gpg --clearsign ajustes.conf
   67  gpg --verify runner.sh.sig runner.sh
   68  gpg --detach-sign --output runner.sh.sig runner.sh
   69  gpg --verify runner.sh.sig runner.sh
   70  git add .
   71  git commit -m "Fix problema 8: firmas GPG corregidas y creadas"
   72  history