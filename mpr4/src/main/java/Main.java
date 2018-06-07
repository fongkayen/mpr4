
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URI;
import java.util.List;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;
import model.Plushie;
import org.glassfish.jersey.client.ClientConfig;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nerianne
 */
public class Main {
    public static void main(String[] args) throws IOException {      
        ClientConfig config = new ClientConfig();      
        Client client = ClientBuilder.newClient(config);      
        WebTarget target = client.target(getBaseURI());      
        String jsonResponse = target.path("v1").path("api").path("plushies").request().accept(MediaType.APPLICATION_JSON).get(String.class);
        System.out.println(jsonResponse);      
        ObjectMapper objectMapper = new ObjectMapper();      
        List<Plushie> plushieList = objectMapper.readValue(jsonResponse, new TypeReference<List<Plushie>>(){});   
        
        System.out.println(plushieList);  
    }
    
    private static URI getBaseURI() {      
        return UriBuilder.fromUri("http://centaurus-7.ics.uci.edu:9994/mpr4").build();  
    }
}