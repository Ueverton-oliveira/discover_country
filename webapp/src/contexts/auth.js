import React, { createContext, useEffect, useState } from "react";
import axios from 'axios';

export const AuthContext = createContext({});

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);

  useEffect(() => {
    const userToken = localStorage.getItem("user_token");
    const usersStorage = localStorage.getItem("users_bd");

    if (userToken && usersStorage) {
      const hasUser = JSON.parse(usersStorage)?.find(
        (user) => user.email === JSON.parse(userToken).email
      );

      if (hasUser) setUser(hasUser);
    }
  }, []);

  const signin = async (email, password) => {
    try {
      const response = await axios.post('http://localhost:3000//login', { email, password });
      const { token } = response.data;
      localStorage.setItem("user_token", JSON.stringify({ email, token }));
      setUser({ email });
      return null; // Retorna null em caso de sucesso
    } catch (error) {
      if (error.response && error.response.status === 401) {
        return "E-mail ou senha incorretos";
      } else {
        console.error("Erro ao tentar fazer login:", error);
        return "Erro ao tentar fazer login";
      }
    }
  };

  const signup = async (email, password) => {
    try {
      await axios.post('http://localhost:3000//signup', { email, password });
      const token = Math.random().toString(36).substring(2);
      localStorage.setItem("user_token", JSON.stringify({ email, token }));
      setUser({ email });
      return null; // Retorna null em caso de sucesso
    } catch (error) {
      console.error("Erro ao tentar registrar:", error);
      if (error.response && error.response.status === 422) {
        return "Já tem uma conta com este e-mail";
      } else {
        return "Erro ao tentar registrar";
      }
    }
  };

  const signout = () => {
    setUser(null);
    localStorage.removeItem("user_token");
  };

  return (
    <AuthContext.Provider
      value={{ user, signed: !!user, signin, signup, signout }}
    >
      {children}
    </AuthContext.Provider>
  );
};
