# Simple Demo For CI/CD


PPT
https://docs.google.com/presentation/d/1LIK4V-CkeFEjRYikOV7TW8xgXiFfIZ_jPHpeOWj1AH8/edit?usp=sharing

* Travis CI 免費版 https://travis-ci.org/ 
    * 免費版網址是 org 結尾，com 結尾為付費版
    * 免費版本僅限於公開的 Git Repo。
    * 付費版可以使用於私人 Git Repo，但只有 100 次免費的 build 次數

* 第一次撰寫 YAML 檔，格式出錯可能會是卡關的地方，只要格式錯誤就無法成功 trigger Travis CI 去 build code，所以可以在 push 到 GitHub 前先把內容貼檔 YAML Lint 檢查 http://www.yamllint.com/

* .travis.yml 內的 token 與 secure 是我在 AWS 上的 IAM user token，demo 結束後都已移除，所以輪你實作時，你必須要產生自己的 token 


* **千萬要記得：一定要把你的 secret token 使用 Travis CLI 加密後，再 push 到 GitHub 內，否則你的 aws 帳號會被鎖定。**
(如何加密：https://docs.travis-ci.com/user/encryption-keys/)

* 要怎樣把 GitHub 的 Pull Request 內的 merge 鎖住？請參考 https://help.github.com/en/github/administering-a-repository/configuring-protected-branches

* 本次範例使用 AWS 的 ECR/ECS，你也可以練習如何 deploy 到自己的 EC2 或其他地方，這部分需要多看文件。

