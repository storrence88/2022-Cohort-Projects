import Test from "./components/Test";
import Home from "./components/Home"
import './index.css'
import { BrowserRouter as Router, Navigate, Route, Routes } from 'react-router-dom'

function App() {
  return (
    <Router>  
      <Routes>
        <Route path='/' element={<Home />}/>
        {/* <Route path='/signup' element={}/> */}
      </Routes>
    </Router>
  );
}

export default App;
