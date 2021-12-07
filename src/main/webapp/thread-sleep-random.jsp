<%

    int range = 1000;

    try {

       range = Integer.parseInt(request.getParameter("range"));

       //Thread.sleep((int)((Math.random()*10000)%10) * 1000);
       Thread.sleep( (int) (Math.random()*range) );
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
