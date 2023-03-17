# MyScripts

自己写的或者魔改的各种脚本



### TraceRoute脚本安装:

``` 
bash <(curl -Ls https://raw.githubusercontent.com/1621391916/MyScripts/main/install_traceroute.sh) 
```

### 安装必要软件:
``` 
bash <(curl -Ls https://raw.githubusercontent.com/1621391916/MyScripts/main/install_libs.sh)
```


### 全球及国内SpeedTest

from： https://www.idcoffer.com/archives/9258
用法： 

### VC 抢机JS脚本
打开 https://free.vps.vc/create-vps, F12-源代码-右上角停用断点(变成蓝色), 控制台粘贴以下代码，到点了直接刷新选地区然后提交
```
document.getElementById("os").options[2].selected = true;
document.getElementById("password").value = "password123";
document.getElementById("purpose").options[2].selected = true;
for (var i = 1; i <= 5; i++) {
    document.evaluate('//*[@id="form-submit"]/fieldset['+i+']/div/div/div/label/input', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.checked = true;
}
```