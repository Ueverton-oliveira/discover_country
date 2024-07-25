import React from "react";
import { useNavigate } from "react-router-dom";
import Button from "../../components/Button";
import Select from "../../components/Select";
import useAuth from "../../hooks/useAuth";
import * as C from "./styles";

const Home = () => {
  const { signout } = useAuth();
  const navigate = useNavigate();

  return (
    <C.Container>
      <C.Content>

        <Select />
        <Button Text="Sair" onClick={() => [signout(), navigate("/")]}>
          Sair
        </Button>
      </C.Content>
    </C.Container>
  );
};

export default Home;
