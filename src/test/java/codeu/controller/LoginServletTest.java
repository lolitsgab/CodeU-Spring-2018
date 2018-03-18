// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import codeu.model.data.User;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

public class LoginServletTest {

  private LoginServlet loginServlet;
  private HttpServletRequest mockRequest;
  private HttpServletResponse mockResponse;
  private RequestDispatcher mockRequestDispatcher;

  @Before
  public void setup() {
    loginServlet = new LoginServlet();
    mockRequest = Mockito.mock(HttpServletRequest.class);
    mockResponse = Mockito.mock(HttpServletResponse.class);
    mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
    Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/login.jsp"))
        .thenReturn(mockRequestDispatcher);
  }

  @Test
  public void testDoGet() throws IOException, ServletException {
    loginServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
  }

  /*
  This test is no longer needed since it should be updated so that invalid usernames are checked during registration
  @Test
  public void testDoPost_BadUsername() throws IOException, ServletException {
    Mockito.when(mockRequest.getParameter("username")).thenReturn("bad !@#$% username");

    loginServlet.doPost(mockRequest, mockResponse);

    Mockito.verify(mockRequest)
        .setAttribute("error", "Please enter only letters, numbers, and spaces.");
    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
  }
  */

  @Test
  public void testDoPost_NewUser() throws IOException, ServletException {
    Mockito.when(mockRequest.getParameter("username")).thenReturn("test username");
    // adding mock password
    Mockito.when(mockRequest.getParameter("username")).thenReturn("testpassword");

    UserStore mockUserStore = Mockito.mock(UserStore.class);
    Mockito.when(mockUserStore.isUserRegistered("test username")).thenReturn(false);
    loginServlet.setUserStore(mockUserStore);

    HttpSession mockSession = Mockito.mock(HttpSession.class);
    Mockito.when(mockRequest.getSession()).thenReturn(mockSession);

    loginServlet.doPost(mockRequest, mockResponse);

    ArgumentCaptor<User> userArgumentCaptor = ArgumentCaptor.forClass(User.class);
    
    Mockito.verify(mockSession).setAttribute("error", "That username was not found.");
    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
/*
    this section no longer needed as it verifies that the user was added to the Userstore when
    I updated the LoginServlet so that it shows error that user was not found
    Mockito.verify(mockUserStore).addUser(userArgumentCaptor.capture());
    Assert.assertEquals(userArgumentCaptor.getValue().getName(), "test username");

    Mockito.verify(mockSession).setAttribute("user", "test username");
    Mockito.verify(mockResponse).sendRedirect("/conversations");
*/
  }

  @Test
  public void testDoPost_ExistingUser() throws IOException, ServletException {
    Mockito.when(mockRequest.getParameter("username")).thenReturn("test username");
    // adding mock password
    Mockito.when(mockRequest.getParameter("password")).thenReturn("testpassword");

    UserStore mockUserStore = Mockito.mock(UserStore.class);
    Mockito.when(mockUserStore.isUserRegistered("test username")).thenReturn(true);

    // when user calls get password should return testpassword
    ArgumentCaptor<User> passwordArgumentCaptor = ArgumentCaptor.forClass(User.class);
    Mockito.verify(password).getPassword(passwordArgumentCaptor.capture()); // captures the password?
    Assert.assertEquals(passwordArgumentCaptor.getValue().getPassword(), "testpassword");
    Mockito.when(password.equals()).thenReturn(true); // not sure if it should be password.equals

    loginServlet.setUserStore(mockUserStore);

    HttpSession mockSession = Mockito.mock(HttpSession.class);
    Mockito.when(mockRequest.getSession()).thenReturn(mockSession);

    loginServlet.doPost(mockRequest, mockResponse);

    Mockito.verify(mockUserStore, Mockito.never()).addUser(Mockito.any(User.class));
    Mockito.verify(mockSession).setAttribute("user", "test username");
    Mockito.verify(mockResponse).sendRedirect("/conversations");
  }
}

// adding a test for an invalid passwor
@Test
public void TestdoPost_InvalidPassword() throw IOException, ServletException {
  Mockito.when(mockRequest.getParameter("username")).thenReturn("test username");

  // adding mock password
  Mockito.when(mockRequest.getParameter("password")).thenReturn("bad password");

  UserStore mockUserStore = Mockito.mock(UserStore.class);
  Mockito.when(mockUserStore.isUserRegistered("test username")).thenReturn(true);

  // test username's password should be testpassword not bad password
  Mockito.when(password.equals()).thenReturn(false);

  loginServlet.setUserStore(mockUserStore);

  HttpSession mockSession = Mockito.mock(HttpSession.class);
  Mockito.when(mockRequest.getSession()).thenReturn(mockSession);

  loginServlet.doPost(mockRequest, mockResponse);

  Mockito.verify(mockSession).setAttribute("error", "Invalid password.");
  Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);


}
