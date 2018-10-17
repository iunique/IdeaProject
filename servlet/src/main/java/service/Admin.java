package service;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.*;
import com.gargoylesoftware.htmlunit.util.Cookie;
import org.springframework.stereotype.Service;

@Service
public class Admin
{
    public void ChangePwd(String user_id, String new_pwd) throws java.io.IOException
    {
        WebClient webclient = new WebClient();
        webclient.getOptions().setCssEnabled(false);
        webclient.getOptions().setJavaScriptEnabled(false);
        webclient.getOptions().setRedirectEnabled(true);
        webclient.getCookieManager().setCookiesEnabled(true);
        HtmlPage htmlpage = (HtmlPage)webclient.getPage("http://acm.wust.edu.cn/loginpage.php");
        HtmlForm form = (HtmlForm)htmlpage.getForms().get(0);
        HtmlElement button = (HtmlElement)htmlpage.getElementByName("submit");
        HtmlTextInput nameField = (HtmlTextInput)form.getInputByName("user_id");
        nameField.setValueAttribute("自己的账号");
        HtmlPasswordInput pwdField = (HtmlPasswordInput)form.getInputByName("password");
        pwdField.setValueAttribute("自己的密码");
        button.click();
        java.util.Set<Cookie> cookies = webclient.getCookieManager().getCookies();
        java.util.Map<String, String> responseCookies = new java.util.HashMap();
        for (Cookie c : cookies) {
            responseCookies.put(c.getName(), c.getValue());
        }
        HtmlPage nextPage = (HtmlPage)webclient.getPage("保密");//之后是分析页面获取按钮模拟修改密码
        HtmlForm form1 = (HtmlForm)nextPage.getForms().get(0);
        HtmlTextInput name = (HtmlTextInput)form1.getInputByName("user_id");
        HtmlTextInput pwd = (HtmlTextInput)form1.getInputByName("passwd");
        com.gargoylesoftware.htmlunit.html.HtmlInput btn = (HtmlInput)form1.getInputsByValue("xxxx").get(0);
        name.setValueAttribute(user_id);
        pwd.setValueAttribute(new_pwd);
        String result = nextPage.asXml();
        btn.click();
        webclient.close();
    }
public boolean checkExist(String id, String Mail) throws java.io.IOException
{
    WebClient webclient = new WebClient();
    webclient.getOptions().setCssEnabled(false);
    webclient.getOptions().setJavaScriptEnabled(false);
    webclient.getOptions().setRedirectEnabled(true);
    webclient.getCookieManager().setCookiesEnabled(true);
    HtmlPage htmlpage = (HtmlPage)webclient.getPage("http://acm.wust.edu.cn/loginpage.php");
    HtmlForm form = (HtmlForm)htmlpage.getForms().get(0);
    HtmlElement button = (HtmlElement)htmlpage.getElementByName("submit");
    HtmlTextInput nameField = (HtmlTextInput)form.getInputByName("user_id");
    nameField.setValueAttribute("自己的账号");
    HtmlPasswordInput pwdField = (HtmlPasswordInput)form.getInputByName("password");
    pwdField.setValueAttribute("自己的密码");
    button.click();
    java.util.Set<Cookie> cookies = webclient.getCookieManager().getCookies();
    java.util.Map<String, String> responseCookies = new java.util.HashMap();
    for (Cookie c : cookies) {
        responseCookies.put(c.getName(), c.getValue());
    }
    HtmlPage nextPage = (HtmlPage)webclient.getPage("http://acm.wust.edu.cn/userinfo.php?user=" + id);
    if (nextPage.getByXPath("/html/body/div[@id='wrapper']/div[@id='main']/center/font[1]").size() == 0)//这里是xpath表达式获取页面元素
    {
        return false;
    }
    HtmlElement item = (HtmlElement)nextPage.getByXPath("/html/body/div[@id='wrapper']/div[@id='main']/center/font[1]").get(0);
    String xml = item.asXml();
    String mail = "";
    String regex = "[a-zA-z\\.[0-9]]*@[a-zA-z[0-9]]*\\.com";
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(regex);
    java.util.regex.Matcher m = p.matcher(xml);
    int num = 0;
    while (m.find()) {
        mail = m.group().toString();
    }
    webclient.close();
    if (Mail.equals(mail))
        return true;
    return false;
    }
}