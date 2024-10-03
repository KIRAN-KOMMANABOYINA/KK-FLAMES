package NameServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NameServlet
 */
@WebServlet("/NameServlet")
public class NameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("boyName");
        String b = request.getParameter("girlName");
        a = a.toLowerCase();
        b = b.toLowerCase();
        int a1[] = new int[26];
        int b1[] = new int[26];
        for(int i = 0; i < a.length(); i++) {
            if(a.charAt(i) != ' ') {
                int x = a.charAt(i) - 97;
                a1[x]++;
            }
        }
        for(int i = 0; i < b.length(); i++) {
            if(b.charAt(i) != ' ') {
                int x = b.charAt(i) - 97;
                b1[x]++;
            }
        }
        int diff = 0;
        for(int i = 0; i < 26; i++) {
            diff += Math.abs(a1[i] - b1[i]);
        }
        int arr[] = new int[6];
        int c = 0, r = 0, x = 0;
        while(c != 5) {
            if(x > 5)
                x = 0;
            if(arr[x] == 0) {
                r++;
                if(r == diff) {
                    arr[x] = 1;
                    c++;
                    r = 0;
                }
            }
            x++;
        }
        int flames = 0;
        for(int i = 0; i < 6; i++) {
            if(arr[i] == 0) {
                flames = i + 1;
                break;
            }
        }
        String result = "";
        if(flames == 1)
            result = "Friends";
        else if(flames == 2)
            result = "Lovers";
        else if(flames == 3)
            result = "Attraction";
        else if(flames == 4)
            result = "Marriage";
        else if(flames == 5)
            result = "Enemies";
        else
            result = "Sister";
        
        // Set the result as a request attribute
        request.setAttribute("result", result);
        
        // Forward the request to index.jsp
        request.getRequestDispatcher("flame.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
