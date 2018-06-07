package resource;

import java.net.URI;
import java.net.URISyntaxException;
import model.Plushie;
import model.PlushieService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Path("/plushies")
public class PlushieResource {
    @Path("{plushie_id}")
    @GET
    @Produces( { MediaType.APPLICATION_JSON })
    public Response getPlushieById(@PathParam("plushie_id") int id) {
        Plushie plushie = PlushieService.getPlushieById(id);

        if(plushie == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        return Response.ok(plushie).build();
    }
    
    @GET
    @Produces( { MediaType.APPLICATION_JSON })
    public Response getAllPlushies() {
        List<Plushie> plushieList = PlushieService.getAllPlushies();

        if(plushieList == null || plushieList.isEmpty()) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        
        return Response.ok(plushieList).build();
    }
}