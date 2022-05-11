import { Link } from 'react-router-dom'
import styles from '../stylesheets/Home.module.scss';

const Home = () => {
    return (
        <div className='flex min-h-screen'>
            
            <div className=" my-60 flex-1">
                <div className='flex flex-col items-center rounded-md lg:mx-20 xl:mx-40 md:mx-8 md:bg-gray-100 py-14' >
                    <span className='block mb-12 text-3xl'>Welcome back</span>

                    <form className='block w-3/5'>
                        <label htmlFor='email' className='block'>Email</label>
                        <input id='emailone' type="text" className='block border-2 rounded-lg w-full mb-6 h-9'/>
                        <label htmlFor="password" className='block '>Password</label>
                        <input id='passwordone'type="text" className="block border-2 rounded-lg w-full mb-12 h-9"/>
                        <button type="submit" className='border w-full rounded-lg  bg-gray-900 text-white h-10 text-lg mb-3'>Sign in</button>
                    </form>
                    <h5>Don't have an account? <Link to='/signup' className="underline">Sing up</Link> here</h5>
                </div>
            </div>
            
            <div className={`${styles.homeimage} md:block flex-1 rounded-lg hidden`}/>

        </div>
    )
}


export default Home
