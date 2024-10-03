<!DOCTYPE html>
<html>
<head>
    <title>KK FLAMES</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #2c3e50, #000000); /* Dark gradient background */
            margin: 0;
            text-align: center;
            overflow: hidden;
        }
        .container {
            background: rgba(255, 255, 255, 0.1); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.5); /* Cyan light effect */
            margin-top: 80px; /* Adjusted for navbar */
            width: 30%;
            text-align: center;
            color: #fff; /* White text color */
            position: relative;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s; /* Animation for hover effect */
        }
        .container:hover {
            transform: translateY(-10px);
            box-shadow: 0 0 50px rgba(0, 255, 255, 0.7); /* Enhanced light effect on hover */
        }
        h1 {
            margin-bottom: 20px;
            color: #fff;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #ccc; /* Light grey text color */
        }
        .input-container {
            position: relative;
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid transparent;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.2); /* Light transparent input background */
            color: #fff;
            font-size: 16px;
            transition: transform 0.2s ease-in-out;
        }
        input[type="text"]:focus {
            transform: scale(1.05);
            outline: none;
            box-shadow: 0 0 5px rgba(0, 255, 255, 0.5); /* Light effect on focus */
        }
        input[type="submit"] {
            background: #6e8efb;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #a777e3;
        }
        .error-symbol {
            display: none;
            position: absolute;
            right: 10px;
            top: 35px;
            color: red;
            font-size: 20px;
        }
        .error-message {
            color: white; /* White color for error message */
            font-size: 14px;
            text-align: left;
            position: absolute;
            bottom: -20px;
            left: 10px;
            width: 100%;
        }
        .error-border {
            border: 1px solid red !important;
        }
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            animation: fadeIn 0.5s ease-in-out;
        }
        .modal-content {
             background-color: #333333; /* Light gray background color */
            margin: 10% auto;
            padding: 40px;
            border: 2px solid transparent; /* No border color, only border-radius visible */
            border-image: linear-gradient(45deg, #6e8efb, #a777e3) 1;
            width: 80%;
            max-width: 600px;
            border-radius: 15px; /* Rounded corners */
            text-align: center;
            color: #FFFFFF; /* Black text color */
            font-weight: normal;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.5); /* Cyan light effect */
            animation: bounceIn 0.7s ease-in-out;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s; /* Animation for hover effect */
        }
        .modal-content:hover {
            transform: translateY(-10px);
            box-shadow: 0 0 50px rgba(0, 255, 255, 0.7); /* Enhanced light effect on hover */
        }
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 20px;
            cursor: pointer;
        }
        .close:hover, .close:focus {
            color: black;
            text-decoration: none;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6e8efb;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
            font-size: 14px;
        }
        .back-btn:hover {
            background: #a777e3;
        }
        h2 {
            color: #000;
        }
        p {
            font-size: 1.2em;
            color: #6e8efb;
        }
        .result-text {
            font-size: 2em; /* Larger font size for result text */
            color: #FFFFFF; /* Dark black color */
            font-weight: bold;
        }
        @keyframes slideIn {
            from {
                transform: translateY(100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes bounceIn {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }
            50% {
                transform: scale(1.1);
                opacity: 1;
            }
            100% {
                transform: scale(1);
            }
        }
        @keyframes blink {
            0%, 100% {
                box-shadow: 0 0 15px rgba(0,0,0,0.4);
            }
            50% {
                box-shadow: 0 0 30px rgba(0,0,0,0.6);
            }
        }
        @keyframes confetti {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(300px);
            }
        }
        h2 {
    color: #FFFFFF; /* White color */
}
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #ffd700;
            top: 0;
            animation: confetti 2s linear infinite;
        }
    </style>
    <script>
        function validateForm() {
            var boyName = document.getElementById('boyName').value;
            var girlName = document.getElementById('girlName').value;
            var boyError = document.getElementById('boyError');
            var girlError = document.getElementById('girlError');
            var boyErrorSymbol = document.getElementById('boyErrorSymbol');
            var girlErrorSymbol = document.getElementById('girlErrorSymbol');
            var regex = /^[A-Za-z\s]+$/;
            var valid = true;

            boyError.textContent = "";
            boyErrorSymbol.style.display = "none";
            girlError.textContent = "";
            girlErrorSymbol.style.display = "none";
            document.getElementById('boyName').classList.remove('error-border');
            document.getElementById('girlName').classList.remove('error-border');

            if (boyName === "") {
                boyError.textContent = "This field is required.";
                boyErrorSymbol.style.display = "inline";
                document.getElementById('boyName').classList.add('error-border');
                valid = false;
            } else if (!regex.test(boyName)) {
                boyError.textContent = "Only letters and spaces are allowed.";
                boyErrorSymbol.style.display = "inline";
                document.getElementById('boyName').classList.add('error-border');
                valid = false;
            }

            if (girlName === "") {
                girlError.textContent = "This field is required.";
                girlErrorSymbol.style.display = "inline";
                document.getElementById('girlName').classList.add('error-border');
                valid = false;
            } else if (!regex.test(girlName)) {
                girlError.textContent = "Only letters and spaces are allowed.";
                girlErrorSymbol.style.display = "inline";
                document.getElementById('girlName').classList.add('error-border');
                valid = false;
            }

            return valid;
        }

        function showModal() {
            var modal = document.getElementById('resultModal');
            modal.style.display = 'block';
            showConfetti();
        }

        function closeModal() {
            var modal = document.getElementById('resultModal');
            modal.style.display = 'none';
        }

        function showConfetti() {
            var modalContent = document.querySelector('.modal-content');
            for (var i = 0; i < 200; i++) {
                var confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.left = Math.random() * 100 + '%';
                confetti.style.animationDuration = Math.random() * 2 + 3 + 's';
                confetti.style.backgroundColor = '#' + Math.floor(Math.random()*16777215).toString(16);
                modalContent.appendChild(confetti);
                setTimeout(function() {
                    confetti.remove();
                }, 5000);
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>FLAMES</h1>
        <form action="NameServlet" method="get" onsubmit="return validateForm()">
            <div class="input-container">
                <label for="boyName">Boy Name:</label>
                <input type="text" id="boyName" name="boyName">
                <span id="boyErrorSymbol" class="error-symbol">!</span>
                <div id="boyError" class="error-message"></div>
            </div>
            
            <div class="input-container">
                <label for="girlName">Girl Name:</label>
                <input type="text" id="girlName" name="girlName">
                <span id="girlErrorSymbol" class="error-symbol">!</span>
                <div id="girlError" class="error-message"></div>
            </div>
            
            <input type="submit" value="Submit">
        </form>
    </div>

    <div id="resultModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Relation!</h2>
            <p id="result" class="result-text">
                <% 
                    String result = (String) request.getAttribute("result");
                    if (result != null) {
                        out.println(result);
                    }
                %>
            </p>
            <button class="back-btn" onclick="window.location.href='flame.jsp'">Back</button>
        </div>
    </div>
    
    <script>
        <% 
            String result1 = (String) request.getAttribute("result");
            if (result1 != null) {
                out.println("showModal();");
            }
        %>
    </script>
</body>
</html>
