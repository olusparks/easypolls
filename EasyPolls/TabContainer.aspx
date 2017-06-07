<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TabContainer.aspx.cs" Inherits="EasyPolls.TabContainer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Easy Polls</title>
    <script src="jscolorFolder/jscolor.js"></script>
    <style>
        .tab {
            float: right;
        }

        .editor {
            font-family: 'Segoe UI',Arial, Consolas;
            background-color:rgb(80, 174, 239);
            width: 40%;
            height: 200px;
            border: 1px solid black;
            border-radius: 10px;
            clear:right;
            color: black;
            margin-left: auto;
        }
        .tabtool {
            float:left;
        }

        .wrapper {
            margin: 0 auto;
        }
        #Radio1 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%" Style="margin-bottom: 0px">
                <ajaxToolkit:TabPanel runat="server" HeaderText="Polls" ID="TabPolls" Width="100%" CssClass="wrapper">

                    <ContentTemplate>
                        <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="1" CssClass="tabtool" Width="50%">
                            <ajaxToolkit:TabPanel ID="TabQuestion" runat="server" HeaderText="Question">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>Question</td>
                                            <td>
                                                <input id="btnRAlign" type="button" value="R-Align" style="width: 100%" /></td>
                                            <td>
                                                <input id="btnLAlign" type="button" value="L-Align" style="width: 100%" /></td>
                                        </tr>
                                        <tr>

                                            <td colspan="3">
                                                <textarea style="width: 366px" onkeyup="getValues()" id="txtQue"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Choices
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input id="txtChoice1" type="text" placeholder="enter choice" style="width: 100%" onkeyup="getChoices()" oninput="" />
                                            </td>
                                            <td>
                                                <asp:Button runat="server" ID="btnMove1" Text="Move" />
                                            </td>
                                            <td>
                                                <input id="btnClear1" type="button" value="Clear" onclick="Clear(id)" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input id="txtChoice2" type="text" placeholder="enter choice" style="width: 100%" />
                                            </td>
                                            <td>
                                                <asp:Button runat="server" ID="btnMove2" Text="Move" />
                                            </td>
                                            <td>
                                                <input id="btnClear2" type="button" value="Clear" onclick="Clear(id)" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <input id="txtChoice3" type="text" placeholder="enter choice" style="width: 100%" />
                                            </td>
                                            <td>
                                                <asp:Button runat="server" ID="btnMove3" Text="Move" />
                                            </td>
                                            <td>
                                                <input id="btnClear3" type="button" value="Clear" onclick="Clear(id)" />
                                            </td>
                                            <td>
                                                <input id="Radio1" type="radio" />
                                            </td>
                                        </tr>
                                    </table>



                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabLook" runat="server" HeaderText="Look & Feel">
                                <ContentTemplate>

                                    <input id="btnHideAndShow" type="button" value="Customize poll design" onclick="showandHide()" />
                                    <br />

                                    <div id="polldesign" style="display: none">
                                        <table>
                                            <tr>
                                                <td style="color:cadetblue; font-weight:bold">Poll Design</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>Poll corner radius:</td>
                                                <td>
                                                    <input type="range" name="Range" id="Range" min="0" max="30" value="10" onchange="updateRangeValue(this.value, name)" /></td>
                                                <td>
                                                    <label id="lblRange">10px</label></td>
                                            </tr>

                                            <tr>
                                                <td>Padding left:</td>
                                                <td>
                                                    <input type="range" name="Range1" id="Range1" min="0" max="30" value="10" onchange="updateRangeValue(this.value, name)" /></td>
                                                <td>
                                                    <label id="lblRange1">10px</label></td>
                                            </tr>

                                            <tr>
                                                <td>Padding right:</td>
                                                <td>
                                                    <input type="range" name="Range2" id="Range2" min="0" max="30" value="10" onchange="updateRangeValue(this.value, name)" /></td>
                                                <td>
                                                    <label id="lblRange2">10px</label></td>
                                            </tr>

                                            <tr>
                                                <td>Padding top:</td>
                                                <td>
                                                    <input type="range" name="Range3" id="Range3" min="0" max="30" value="10" onchange="updateRangeValue(this.value, name)" /></td>
                                                <td>
                                                    <label id="lblRange3">10px</label></td>
                                            </tr>

                                            <tr>
                                                <td>Padding bottom:</td>
                                                <td>
                                                    <input type="range" name="Range4" id="Range4" min="0" max="30" value="10" onchange="updateRangeValue(this.value, name)" /></td>
                                                <td>
                                                    <label id="lblRange4">10px</label></td>
                                            </tr>
                                            <tr>
                                                <td>Background Color:</td>
                                                <td>
                                                    <input id="bkg-color" class="jscolor {onFineChange:'update(this)'}" value=""></td>
                                            </tr>
                                            <tr>
                                                <td style="color:cadetblue; font-weight:bold">Text Styles</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>Question Text:</td>
                                                <td>
                                                    <select id="que-font" class="input" onchange="changeFont(this,id);">
                                                        <option value="Times New Roman" >Times New Roman</option>
                                                        <option value="Arial">Arial</option>
                                                        <option value="Century Gothic">Century Gothic</option>
                                                        <option value="Courier">Courier</option>
                                                        <option value="Courier New">Courier New</option>
                                                        <option value="Georgia">Georgia</option>
                                                        <option value="Impact">Impact</option>
                                                        <option value="Tahoma" selected="selected">Tahoma</option>
                                                        <option value="Verdana">Verdena</option>
                                                    </select></td>
                                                <td>
                                                    <input type="text" id="que-ftSize" value="11" onchange="setTimeout(onchangeFontSize(value), 3000);" size="2"/></td>
                                                <td>
                                                    <input type="button" id="que-Bold" value="B"  onclick="makeBold(id);"/></td>
                                                <td><input type="button" id="que-Italic" value="/"  onclick="makeItalic(id);"/></td>
                                                <td>
                                                    <input id="que-color" class="jscolor {onFineChange:'update(this)'}" value=""></td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Choice</td>
                                                <td> <select id="choice1-font" class="input" onchange="changeFont(this,id);">
                                                        <option value="Times New Roman" >Times New Roman</option>
                                                        <option value="Arial">Arial</option>
                                                        <option value="Century Gothic">Century Gothic</option>
                                                        <option value="Courier">Courier</option>
                                                        <option value="Courier New">Courier New</option>
                                                        <option value="Georgia">Georgia</option>
                                                        <option value="Impact">Impact</option>
                                                        <option value="Tahoma" selected="selected">Tahoma</option>
                                                        <option value="Verdana">Verdena</option>
                                                    </select></td>
                                                <td>
                                                    <input type="text" id="ch1-ftSize" value="11" onchange="setTimeout(onchangeFontSize(value), 3000);" size="2"/></td>
                                                <td>
                                                    <input type="button" id="ch1-Bold" value="B"  onclick="makeBold(id);"/></td>
                                                <td><input type="button" id="ch1-Italic" value="/"  onclick="makeItalic(id);"/></td>
                                                <td>
                                                    <input id="ch1-color" class="jscolor {onFineChange:'update(this)'}" value=""></td>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />

                                    <div id="applyStyle">
                                        <input id="btnRed" type="button" value="Red" onclick="changeStyle(value)" style="background-color: rgb(239, 94, 92)" />
                                        <br />
                                        <br />
                                        <input id="btnGreen" type="button" value="Green" onclick="changeStyle(value)"  style="background-color:rgb(138, 223, 98)"/>
                                        <br />
                                        <br />
                                        <input id="btnBlue" type="button" value="Blue" onclick="changeStyle(value)" style="background-color:rgb(103, 192, 246)"/>
                                    </div>

                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabOptions" runat="server" HeaderText="Options">
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabPremium" runat="server" HeaderText="Premium">
                            </ajaxToolkit:TabPanel>
                        </ajaxToolkit:TabContainer>

                        <div class="editor" runat="server" id="ed">
                            <asp:Label runat="server" ID="questionLabel"></asp:Label>

                            <div>
                                <label id="header"></label>
                            </div>
                            <div>
                                <span>
                                    <input id="Radio2" type="radio" style="display: none" />
                                    <label id="choice1"></label>
                                </span>
                                <label id="choice2"></label>
                                <span id="radBtn"></span>
                                <label id="choice3"></label>
                            </div>
                            <table id="myTable">
                            </table>
                        </div>
                    </ContentTemplate>

                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabMyPolls" runat="server" HeaderText="My Polls">
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabContain" runat="server" HeaderText="Container">
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabTellAFriend" runat="server" HeaderText="Tell a Friend">
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabAccount" runat="server" HeaderText="Account">
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>

        </div>
    </form>

    <script>
        function getValues() {
            var question = document.getElementById("txtQue").value;
            document.getElementById("header").innerText = question;
            //1003385668
        }
        function getChoices() {
            document.getElementById("Radio2").style.display = 'block';
            var choice = document.getElementById("txtChoice1").value;
            document.getElementById("choice1").innerText = choice;
        }
        function createRadioElement(choice) {

            var radio = document.createElement("input");
            radio.type = "radio";
            radio.value = choice;
            document.getElementById("radBtn").appendChild(radio);
        }

        function changeStyle(buttonText) {
            var redButton = document.getElementById("btnRed").value;
            var blueButton = document.getElementById("btnBlue").value;
            var greenButton = document.getElementById("btnGreen").value;
            if (redButton == buttonText) {
                document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "color:white; width:500px; height :200px; border: 1px solid red; border-radius: 10px; background-color:rgb(239, 94, 92);");
            } else if (blueButton == buttonText) {
                document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "color:white; width:500px; height :200px; border: 1px solid blue; border-radius: 10px; background-color:rgb(103, 192, 246);");
            } else {
                document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "color:white; width:500px; height :200px; border: 1px solid green; border-radius: 10px; background-color:rgb(138, 223, 98);");
            }
        }

        function showandHide() {
            var x = document.getElementById("polldesign")
            var name = document.getElementById("btnHideAndShow");
            if (x.style.display === 'none') {
                x.style.display = 'block';
                name.value = "Hide look & feel options";
            } else {
                x.style.display = 'none';
                name.value = "Customize poll design";
            }
        }

        function updateRangeValue(rangeVal, name) {
            switch (name) {
                case "Range":
                    var RangeValue = document.getElementById("lblRange").innerText = rangeVal + "px";
                    document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "border-radius: " + RangeValue + "");
                    break;
                case "Range1":
                    var RangeValue1 = document.getElementById("lblRange1").innerText = rangeVal + "px";
                    document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "padding-left: " + RangeValue1 + "");
                    break;
                case "Range2":
                    var RangeValue2 = document.getElementById("lblRange2").innerText = rangeVal + "px";
                    document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "padding-right: " + RangeValue2 + "");
                    break
                case "Range3":
                    var RangeValue3 = document.getElementById("lblRange3").innerText = rangeVal + "px";
                    document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "padding-top: " + RangeValue3 + "");
                    break;
                case "Range4":
                    var RangeValue4 = document.getElementById("lblRange4").innerText = rangeVal + "px";
                    document.getElementById("TabContainer1_TabPolls_ed").setAttribute("style", "padding-bottom: " + RangeValue4 + "");
                    break;
            }
        }

        function Clear(id) {
            switch (id) {
                case "btnClear1":
                    document.getElementById("TabContainer1_TabPolls_TabContainer2_TabQuestion_txtChoice1").value = "";
                    break;
                case "btnClear2":
                    document.getElementById("TabContainer1_TabPolls_TabContainer2_TabQuestion_txtChoice2").value = "";
                    break;
                case "btnClear3":
                    document.getElementById("TabContainer1_TabPolls_TabContainer2_TabQuestion_txtChoice3").value = "";
                    break;
            }
        }

        function update(jscolor) {
            // 'jscolor' instance can be used as a string
            var getColor = jscolor.valueElement
            var id = getColor.id
            switch (id) {
                case "bkg-color":
                    document.getElementById('TabContainer1_TabPolls_ed').style.backgroundColor = '#' + jscolor;
                    break;
                case "que-color":
                    document.getElementById('header').style.color = '#' + jscolor;
                    break;
            }
            
        }

        var changeFont = function (font, valueid) {
            switch (valueid) {
                case "que-font":
                    console.log(font.value)
                    document.getElementById("header").style.fontFamily = font.value;
                    document.getElementById("txtQue").style.fontFamily = font.value;
                    break;
                case "choice1-font":
                    console.log(font.value)
                    document.getElementById("choice1").style.fontFamily = font.value;
                    document.getElementById("choice2").style.fontFamily = font.value;
                    document.getElementById("choice3").style.fontFamily = font.value;
                    break;
            }
        }

        function onchangeFontSize(fontSize, id) {
            var afontSize = fontSize + "px";
            switch (id) {
                case "que-ftSize":
                    console.log(fontSize);
                    document.getElementById("header").style.fontSize = afontSize;
                    document.getElementById("txtQue").style.fontSize = afontSize
                    break;
                case "ch1-ftSize":
                    console.log(fontSize);
                    document.getElementById("choice1").style.fontSize = afontSize;
                    document.getElementById("choice2").style.fontSize = afontSize
                    document.getElementById("choice3").style.fontSize = afontSize
                    break;
            }
            ;
        } 

        function makeBold(id) {
            switch (id) {
                case "que-Bold":
                    var header = document.getElementById("header")
                    var question = document.getElementById("txtQue")
                    if (header.style.fontWeight == "normal" || header.style.fontWeight == '') {
                        document.getElementById("header").style.fontWeight = 'bold';
                        //document.getElementById("txtQue").style.fontWeight = 'bold';
                    }
                    else {
                        document.getElementById("header").style.fontWeight = 'normal';
                        //document.getElementById("txtQue").style.fontWeight = 'normal';
                    }
                    break;
                case "ch1-Bold":
                    var choice1 = document.getElementById("choice1");
                    var choice2 = document.getElementById("choice2");
                    var choice3 = document.getElementById("choice3");
                    if (choice1.style.fontWeight == "normal" || choice1.style.fontWeight == '' || choice2.style.fontWeight == "normal" || choice2.style.fontWeight == ''
                        || choice3.style.fontWeight == "normal" || choice3.style.fontWeight == '') {
                        document.getElementById("choice1").style.fontWeight = 'bold';
                        document.getElementById("choice2").style.fontWeight = 'bold';
                        document.getElementById("choice3").style.fontWeight = 'bold';
                    }
                    else {
                        document.getElementById("choice1").style.fontWeight = 'normal';
                        document.getElementById("choice2").style.fontWeight = 'normal';
                        document.getElementById("choice3").style.fontWeight = 'normal';
                    }
                    break;
            }
            
        }
        
        function makeItalic() {
            switch (id) {
                case "que-Italic":
                    var header = document.getElementById("header")
                    var question = document.getElementById("txtQue")
                    if (header.style.fontStyle == "normal" || header.style.fontStyle == '') {
                        document.getElementById("header").style.fontStyle = 'italic';
                        //document.getElementById("txtQue").style.fontStyle = 'italic';
                    }
                    else {
                        document.getElementById("header").style.fontStyle = 'normal';
                        //document.getElementById("txtQue").style.fontStyle = 'normal';
                    }
                    break;
                case "ch1-Italic":
                    var choice1 = document.getElementById("choice1");
                    var choice2 = document.getElementById("choice2");
                    var choice3 = document.getElementById("choice3");
                    if (choice1.style.fontStyle == "normal" || choice1.style.fontStyle == '' || choice2.style.fontStyle == "normal" || choice2.style.fontStyle == ''
                        || choice3.style.fontStyle == "normal" || choice3.style.fontStyle == '') {
                        document.getElementById("choice1").style.fontStyle = 'italic';
                        document.getElementById("choice2").style.fontStyle = 'italic';
                        document.getElementById("choice3").style.fontStyle = 'italic';
                    }
                    else {
                        document.getElementById("choice1").style.fontStyle = 'normal';
                        document.getElementById("choice2").style.fontStyle = 'normal';
                        document.getElementById("choice3").style.fontStyle = 'normal';
                    }
                    break;
            }
        }
    </script>
</body>
</html>
