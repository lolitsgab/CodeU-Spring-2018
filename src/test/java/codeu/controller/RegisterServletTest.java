package codeu.controller;

import codeu.model.data.User;
import codeu.model.data.Profile;
import codeu.model.store.basic.ProfileStore;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import org.mindrot.jbcrypt.BCrypt;

public class RegisterServletTest {

 private RegisterServlet registerServlet;
 private HttpServletRequest mockRequest;
 private HttpServletResponse mockResponse;
 private RequestDispatcher mockRequestDispatcher;

 @Before
 public void setup() {
   registerServlet = new RegisterServlet();
   mockRequest = Mockito.mock(HttpServletRequest.class);
   mockResponse = Mockito.mock(HttpServletResponse.class);
   mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
   Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/register.jsp"))
       .thenReturn(mockRequestDispatcher);
 }

 @Test
 public void testDoGet() throws IOException, ServletException {
   registerServlet.doGet(mockRequest, mockResponse);

   Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
 }

 @Test
 public void testDoPost_BadUsername() throws IOException, ServletException {
   Mockito.when(mockRequest.getParameter("username")).thenReturn("bad !@#$% username");
   Mockito.when(mockRequest.getParameter("password")).thenReturn("password one");

   registerServlet.doPost(mockRequest, mockResponse);

   Mockito.verify(mockRequest)
       .setAttribute("error", "Please enter only letters, numbers, and spaces.");
   Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
 }
/*
FIX LATER!!!!!!!!!!!!!!! commented out for now because nullptr error when new register because need to add in the profile part
i commented this out because i was testing things and am not 100% sure if its right yet  */
 @Test
 public void testDoPost_NewUser() throws IOException, ServletException {
   Mockito.when(mockRequest.getParameter("username")).thenReturn("test username");
   Mockito.when(mockRequest.getParameter("password")).thenReturn("password two");
   String passwordHash = BCrypt.hashpw("password two", BCrypt.gensalt());

   UserStore mockUserStore = Mockito.mock(UserStore.class);
   Mockito.when(mockUserStore.isUserRegistered("test username")).thenReturn(false);
   registerServlet.setUserStore(mockUserStore);

   ProfileStore mockProfileStore = Mockito.mock(ProfileStore.class);
   registerServlet.setProfileStore(mockProfileStore);
   
   registerServlet.doPost(mockRequest, mockResponse);

   ArgumentCaptor<User> userArgumentCaptor = ArgumentCaptor.forClass(User.class);

   Mockito.verify(mockUserStore).addUser(userArgumentCaptor.capture());
   Assert.assertEquals(userArgumentCaptor.getValue().getName(), "test username");
   Assert.assertTrue(BCrypt.checkpw("password two", passwordHash));


   ArgumentCaptor<Profile> profileArgumentCaptor = ArgumentCaptor.forClass(Profile.class);
   Mockito.verify(mockProfileStore).addProfile(profileArgumentCaptor.capture());
   Assert.assertEquals(profileArgumentCaptor.getValue().getUserName(), "test username");

   Mockito.verify(mockResponse).sendRedirect("/login");
 }

 @Test
 public void testDoPost_ExistingUser() throws IOException, ServletException {
   Mockito.when(mockRequest.getParameter("username")).thenReturn("test username");
   Mockito.when(mockRequest.getParameter("password")).thenReturn("password three");

   UserStore mockUserStore = Mockito.mock(UserStore.class);
   Mockito.when(mockUserStore.isUserRegistered("test username")).thenReturn(true);
   registerServlet.setUserStore(mockUserStore);

   registerServlet.doPost(mockRequest, mockResponse);

   Mockito.verify(mockRequest).setAttribute("error", "That username is already taken.");
   Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
 }
}
