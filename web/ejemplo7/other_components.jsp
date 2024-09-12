<%-- 
    Document   : other_components
    Created on : Sep 10, 2024, 9:29:21 AM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Server Page</title>
    </head>
    <body>
        <h1>Other Components</h1>
        <form action="process.jsp">
        <p>
            1. Normal text field: <input type="text" name="txtName" /> 
        </p>
        <p>
            2. Scripted text field: <input type="password" name="txtPassword" />
        </p>
        <p>
            3. Radio button to select different options:
            <input type="radio" name="radioG" value="H" />Man
            <input type="radio" name="radioG" value="M" />Woman
        </p>
        <p>
            4. Simple check box:
            <input type="checkbox" name="chbAccept" />Accept to access personal information. 
        </p>
        <p>
            5.Multiple check box: 
            <input type="checkbox" name="chbHobby" value="Chess" />Chess
            <input type="checkbox" name="chbHobby" value="Footblal" />Football
            <input type="checkbox" name="chbHobby" value="Cinema" />Cine
            <input type="checkbox" name="chbHobby" value="Photography" />Photography
        </p>
        <p>
            6. Simple combo selection:
            <select name="cboCountryCode" size="1" >
                <option selected>Select country</option>  
                <option value="CH" >Chile</option>  
                <option value="RO" >Romania</option>  
                <option value="SP" >Spain</option>  
                <option value="UK" >United Kingdom</option>  
            </select>
        </p>
        <p>
            7. Multiple selection list:
            <select name="lstPet" multiple="true" size="3" >
                <option value="Cat" >Cat</option>  
                <option value="Dog" >Dog</option>  
                <option value="Tiger" >Tiger</option>   
                <option value="Lion" >Lion</option>   
                <option value="Monkey" >Monkey</option>   
                <option value="Hamster" >Hamster</option>   
            </select>
        </p>
        <p>
            8. Insert email:
            <input type="email" 
                   pattern=".+@gmail.com" 
                   size="18"
                   placeholder="user@gmail.com"
                   minlenght="18"
                   maxlenght="18"
                   list="emailList"
                   name ="myEmail"
                   required />
            
            <datalist id="emailList">
                <option value="luis@gmail.com" />
                <option value="miguel@gmail.com" />
                <option value="angela@gmail.com" />
                <option value="matthew@gmail.com" />
            </datalist>
        </p>
        <p>
            <label id="phoneNumber">
            9. Insert your phone number:
            
            <input type="tel"
                   name="myPhone"
                   id="phoneNumber"
                   pattern="[0-9]{9,9}"
                   size="12"
                   placeholder = "xxxxxxxxx"
                   minlenght="18"
                   maxlenght="18"
                   list="phoneNumberList"
                   required />
            <datalist id="phoneNumberList">
                <option value="625942928" />
                <option value="609164121" />
                <option value="666777888" />
                <option value="765892345" />
            </datalist>
            </label>
        </p>
        <p>
            <label for="lblMeeting"> 
                10. Choose a time for the meeting between 9:00 and 18:00 hours
            </label>
            <input 
                type="time" 
                name="txtHour" 
                min="09:00" 
                max="18:00"
                id="lblMeeting"
                required />    
        </p>
        <p>
            <label for="lblMeetingDate"> 
                11. Choose a date and an hour for the meeting.
            </label>
            <input 
                type="datetime-local" 
                name="txtDate" 
                min="09:00" 
                max="18:00"
                id="lblMeetingDate"
                required />
        </p>
        <p>
            <input type="submit" name="btnSend" value="Send" />
        </p>
        </form>
        <a href="../ejemplo5/index.jsp">Go to the index.</a><br>
    </body>
</html>
